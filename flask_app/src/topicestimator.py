import numpy as np
import gensim
import pickle
import MeCab


class TopicEstimator:
    # 検索ワード
    TOPICS = {'COVID-19': 'コロナ', 'heartstroke': '熱中症', 'exercise': '運動', 'lifehack': 'ライフハック', 
              'mental': 'メンタルヘルス', 'meal': '食事', 'sleep': '睡眠'}
    def __init__(self, dict_path='models/dict.dict', lsi_path='models/lsi_model.model', svm_path = 'models/svm.pickle'):
        self.dct = gensim.corpora.Dictionary.load(dict_path)
        self.lsi_model = gensim.models.LsiModel.load(lsi_path)
        self.classifier = pickle.load(open(svm_path, 'rb'))

    def _split_to_words(self, text):
        """
        args:
            text(str): '東京都内では29日、熱中症の疑いで50人が病院に運ばれました'
        return:
            words(list<str>): ['東京', '都内', '熱中', '疑い', '病院']
        """
        tagger = MeCab.Tagger('mecabrc')  # 別のTaggerを使ってもいい
        mecab_result = tagger.parse(text)
        if not(mecab_result):
            return []
        info_of_words = mecab_result.split('\n')
        words = []
        for info in info_of_words:
            # macabで分けると、文の最後に’’が、その手前に'EOS'が来る
            if info == 'EOS' or info == '':
                break
                # info => 'な\t助詞,終助詞,*,*,*,*,な,ナ,ナ'
            info_elems = info.split('\t')
            part_of_speech = info_elems[4].split('-')
            # if part_of_speech in ['補助記号', '助詞']:
            if part_of_speech[0] != '名詞' or ('数詞' in part_of_speech):
                continue
            words.append(info_elems[0])
        return words

    def words(self, text):
        words = self._split_to_words(text=text)
        return words

    def _vec2dense(self, vec, num_terms):
        """
        Convert from sparse gensim format to dense list of numbers
        """
        return list(gensim.matutils.corpus2dense([vec], num_terms=num_terms).T[0])

    def predict(self, x):
        input_data = []
        for d in x:
            input_data.append(self.words(d))

        num_topics = len(self.TOPICS)
        vecs = []
        for inp in input_data:
            vec = self.dct.doc2bow(inp)
            lsi_doc = self.lsi_model[vec]
            vecs.append(self._vec2dense(lsi_doc, num_topics))
        vecs = np.array(vecs)
        unit_vecs = vecs / np.linalg.norm(vecs, ord=2, axis=1).reshape(len(vecs), 1)
        # print(unit_vecs)
        nan_indice = ~np.isnan(unit_vecs).any(axis=1)
        unit_vecs = np.nan_to_num(unit_vecs)
        prob = self.classifier.predict_proba(unit_vecs)
        return prob

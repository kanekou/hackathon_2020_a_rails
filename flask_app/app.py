import os
import sys
os.chdir(os.path.dirname(os.path.abspath(__file__)))
# import gensim
from flask import Flask, jsonify
import src.news as news
import src.topicestimator as te

app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False
model = te.TopicEstimator()


@app.route("/")
def hello():
    print(sys.path)
    return "Hello, Flask! in Repository"

@app.route('/test')
def test():
    return jsonify({'message': 'test is ok.'})

@app.route('/get_news')
def get_news():
    articles1, description1 = news.get_from_newsapi()
    articles2, description2 = news.get_from_nhk()

    articles = articles1 + articles2
    description = description1 + description2
    probs = model.predict(description)

    top_indice = news.calc_top_n(probs, n=10, num_topics=len(model.TOPICS))

    topic_list = list(model.TOPICS.keys())
    responce = {'articles': []}
    for i, indice in enumerate(top_indice):
        for idx in indice:
            target = articles[idx]
            target['topic'] = topic_list[i]
            responce['articles'].append(target)

    return jsonify(responce)

if __name__ == "__main__":
    app.run(host='0.0.0.0')

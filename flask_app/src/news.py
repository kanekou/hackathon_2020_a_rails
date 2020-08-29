from newsapi import NewsApiClient
from datetime import datetime as dt
from datetime import timedelta
import requests
import numpy as np
from bs4 import BeautifulSoup as bs

DATE_FORMAT = '%Y-%m-%d %H:%M:%S'
required_keys = ['title', 'summary', 'url', 'image', 'written_at']


def get_from_newsapi():
    descriptions = []
    articles = []
    # NewsAPI
    NEWSAPI_ATTR2ID = {'title': 'title', 'url': 'url', 'image': 'urlToImage', 'written_at': 'publishedAt', 'summary': 'description'}
    newsapi = NewsApiClient(api_key='d9cc224113f649869ee2ee4e25198595')
    headlines = newsapi.get_top_headlines(country='jp', page_size=40)
    for a in headlines['articles']:
        article = {}
        for k in required_keys:
            if k == 'written_at':
                a[NEWSAPI_ATTR2ID[k]] = (dt.strptime(a['publishedAt'], '%Y-%m-%dT%H:%M:%SZ') + timedelta(hours=9)).strftime(DATE_FORMAT)
            article[k] = a[NEWSAPI_ATTR2ID[k]]
        descriptions.append(article['summary'])
        articles.append(article)

    return articles, descriptions

def get_from_nhk():
    descriptions = []
    articles = []
    # NHK
    NHK_URL = [0, 1, 2, 3]  # 主要ニュース，社会，文化・エンタメ，科学・医療
    NHK_ATTR2ID = {'title': 'title', 'url': 'link', 'written_at': 'pubDate', 'summary': 'description'}
    for idx in NHK_URL:
        url = f'https://www.nhk.or.jp/rss/news/cat{idx}.xml'
        res = requests.get(url)
        soup = bs(res.text, 'xml')
        for a in soup.select('item'):
            article = {}
            for k in required_keys:
                if k == 'written_at':
                    date = a.find(NHK_ATTR2ID[k]).text
                    date_formated = dt.strptime(date, '%a, %d %b %Y %H:%M:%S +0900').strftime(DATE_FORMAT)
                    article[k] = date_formated
                    continue
                # NHKはimage無し
                try:
                    article[k] = a.find(NHK_ATTR2ID[k]).text
                except:
                    continue
            descriptions.append(article['summary'])
            articles.append(article)

    return articles, descriptions

def calc_top_5(probs, num_topics):
    # 予測されたラベル列
    pred_labels = np.argmax(probs, axis=1)
    top_5_indices = []
    for l in range(num_topics):
        indice = np.where(pred_labels == l)
        tmp = probs[indice]
        top_5 = np.argsort(tmp[:, l])[::-1][:5]
        top_5_indices.append(indice[0][top_5])

    return top_5_indices

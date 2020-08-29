from flask import Flask, jsonify
from newsapi import NewsApiClient
from datetime import datetime as dt
from datetime import timedelta

app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False

newsapi = NewsApiClient(api_key='d9cc224113f649869ee2ee4e25198595')

@app.route("/")
def hello():
    return "Hello, Flask! in Repository"

@app.route('/test')
def test():
    return jsonify({'message': 'test is ok.'})

@app.route('/get_news')
def get_news():
    headlines = newsapi.get_top_headlines(country='jp')
    ret = {}
    articles = []
    for a in headlines['articles']:
        item = {}
        item['title'] = a['title']
        item['summary'] = a['description']
        item['url'] = a['url']
        item['image'] = a['urlToImage']
        item['written_at'] = (dt.strptime(a['publishedAt'], '%Y-%m-%dT%H:%M:%SZ') + timedelta(hours=9)).strftime('%Y-%m-%d %H:%M:%S')
        articles.append(item)

    ret['articles'] = articles[:5]
    return jsonify(ret)

if __name__ == "__main__":
    app.run()

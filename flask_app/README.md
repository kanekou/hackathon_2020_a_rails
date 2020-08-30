# Usage
```
$ conda create --name <env> --file requirements/conda_requirements.txt
$ pip install -r requirements/requirements.txt
```
ローカルでサーバー起動
```
$ python app.py
```
ブラウザで`http://localhost:5000`にアクセス

# Method
## ニュース記事をスクレイピング，トピック分類

`GET http://localhost:5000/get_news`

```
{
	articles: [
		{
      topic: "COVID-19",
      title: "記事タイトル",
			summary: "記事の内容の冒頭抜粋......",
			url: "記事URL",
      image: "記事のメイン画像のURL",
      written_at: "2020-08-29 15:00"
		},
    ......
  ]
}
```

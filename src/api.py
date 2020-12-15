from flask import Flask, redirect, request as flask_req


app = Flask(__name__)
# starting()


@app.route('/whl')
@app.route('/wheel')
def whl():
    url = ''
    return redirect(url), 302


@app.route('/status')
def status():
    url = ''
    return redirect(url), 302


# If run on local machine:
if __name__ == '__main__':
    app.run(host='localhost', port=10564, debug=False)

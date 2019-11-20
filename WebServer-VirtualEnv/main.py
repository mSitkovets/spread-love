from flask import Flask, render_template, request
from flask_socketio import SocketIO, emit
import math
from datetime import datetime

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app)

myjson = {'all_transactions':[],
'donations':0,
'balance':2000}


@app.route('/transactions')
def transactions():
    return render_template('transactions.html')

@app.route('/emit')
def emit_now():
    print('sup')
    dt = datetime.now()
    ts = str(dt.day)+'/'+str(dt.month)+'/'+str(dt.year)+' '+str(dt.hour)+':'+str(dt.minute)
    current_balance = float(str(request.args.get('current-balance')))
    company = request.args.get('company')
    category = request.args.get('category')
    amount = float(str(request.args.get('amount')))
    amount1 = round(math.ceil(amount)-amount,2)
    category1 = 'Charity'
    company1 = 'Childrens Funds Foundation'
    total_charge = math.ceil(amount)
    new_balance = current_balance - amount - amount1
    # append
    myjson['all_transactions'].append({'date':ts, 'company': company,'category': category,'amount': amount})
    myjson['all_transactions'].append({'date':ts, 'company': company1,'category': category1,'amount': amount1})
    myjson['donations'] = myjson['donations'] + amount1
    myjson['balance'] = myjson['balance'] - amount1 - amount1

    socketio.emit('my event', {'date':ts, 'company': company,'category': category,'amount': amount,'company1': company1,'category1': category1,'amount1': amount1}, namespace='/test')
    return str(new_balance)


@app.route('/get_transactions')
def get_transactions():
    return myjson



@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')

if __name__ == "__main__":
    socketio.run(app,debug=True)
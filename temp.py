
from flask import Flask,request,jsonify
import pickle
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.externals import joblib


app = Flask(__name__)



@app.route('/predict', methods=['GET'])
def predict():
    nb_spam_model = open('NB_spam_model.pkl', 'rb')
    clf = joblib.load(nb_spam_model)
    cv_fit = pickle.load(open("vector.pickel", "rb"))
    d1={}
    d2={}
    Query =request.args.get('Query')
    
    
    message =[Query]
     
    
    vect = cv_fit.transform(message).toarray()    
    
    my_prediction = clf.predict(vect)
    
    if (my_prediction == 1):
        d1['Query'] ="SPAM !!!"
        
        return jsonify(d1)
#    print(my_prediction)
    else:
        d2['Query'] ="NOT A SPAM"
        return jsonify(d2)



if __name__ == '__main__':
    app.run()    
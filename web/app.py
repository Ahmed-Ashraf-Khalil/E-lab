from flask import Flask, redirect, url_for, render_template , request , flash, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin,login_user,LoginManager,login_required ,current_user,logout_user
from email_validator import validate_email, EmailNotValidError
from flask_bcrypt import Bcrypt
from flask_bootstrap import Bootstrap
from functools import wraps



app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI']="sqlite:///DataBase.db"
app.config['SECRET_KEY']='E-LAB'
db=SQLAlchemy(app)
bcrypt=Bcrypt(app)
bootstrap = Bootstrap(app)


Login_manager=LoginManager()
Login_manager.init_app(app)
Login_manager.login_view='login'


@Login_manager.user_loader
def Load_User(id):
    return User.query.get(int(id))



#DATABASE CREATION
class User(db.Model,UserMixin):
    id =db.Column(db.Integer,primary_key=True)
    username=db.Column(db.String(30),nullable=False)
    email = db.Column(db.String(120), nullable=False, unique=True)
    password=db.Column(db.String(30),nullable=False)
    phone_number = db.Column(db.String(40), nullable=False)
    gender =db.Column(db.String(10),nullable=False)
    blood_type =db.Column(db.String(5),nullable=True)
    birth_date = db.Column(db.String(40), nullable=True)


with app.app_context():
    db.create_all()

#===============================decorator=========================
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        # Check if user is logged in
        if not current_user.is_authenticated:
            flash("Please login to access this page", "warning")
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function


#=================================home page========================
@app.route("/")
def home():
    user = None
    username = None
    if current_user.is_authenticated:
        user = User.query.filter_by(username=current_user.username).first()
        # username = user.username if user else None
    return render_template("index.html" ,user=current_user)

#=================================error page========================
@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html'), 404

#===================================brain tumor===========================
@app.route("/brain-tumor")
@login_required
def brain():
    user = User.query.filter_by(username=current_user.username).first()
    username = user.username if user else None
    return render_template("diagnoses/brain.html",username=username)

#===============================Chest x-ray=========================
@app.route("/chest-x-ray")
@login_required
def chest():
    user = User.query.filter_by(username=current_user.username).first()
    username = user.username if user else None
    return render_template("diagnoses/xray.html",username=username)

#===============================Skin cancer=========================
@app.route("/skin-cancer")
@login_required
def skin():
    user = User.query.filter_by(username=current_user.username).first()
    username = user.username if user else None
    return render_template("diagnoses/skin.html",username=username)

#===============================Diabetes=========================
@app.route("/diabetes")
@login_required
def diabete():
    user = User.query.filter_by(username=current_user.username).first()
    username = user.username if user else None
    gender = user.gender if user else None
    return render_template("diagnoses/diabetes.html",username=username ,gender=gender)



#===============================authentication===========================================

#===============================login=========================
@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        # Validate email and password
        if not email:
            flash('Please enter an email address.',category="danger")
            return redirect(url_for('login'))
        if not password:
            flash('Please enter a password.',category="danger")
            return redirect(url_for('login'))

        # Perform login action
        user = User.query.filter_by(email=email).first()
        if user is None:
            flash('Invalid email or password.',category="danger")
            return redirect(url_for('login'))

        # Check if password is correct
        if not bcrypt.check_password_hash(user.password, password):
            flash('Invalid email or password.',category="danger")
            return redirect(url_for('login'))

        # Login the user
        login_user(user, remember=True)
        return redirect(url_for('home'))

    return render_template('login.html', user=current_user)

#===============================signup=========================
@app.route("/signup", methods=['POST', 'GET'])
def signup():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password1']
        gender = request.form['gender']
        blood_type = request.form['blood_type']
        birth_date = request.form['birth_date']
        phone_number = request.form['phone_number']

        # check if username already exists in the database
        # existing_user = User.query.filter_by(username=username).first()
        if len(username) < 2:
            flash("name must be grater than 1 character." ,"danger")
            return redirect(url_for('signup'))

        # check if email is valid
        try:
            validate_email(email)
        except EmailNotValidError as e:
            flash(str(e),"danger")
            return redirect(url_for('signup'))

        # Check if email already exists in the database
        existing_email = User.query.filter_by(email=email).first()
        if existing_email:
            flash("This email address is already registered. Please use a different email" ,"danger")
            return redirect(url_for('signup'))


        # check if password and confirm password match
        # if password != confirm_password:
        #     flash("Password and confirm password do not match." ,"danger")
        #     return redirect(url_for('signup'))

        # check if password less than 7 characters
        if len(password) < 8:
            flash("Password Must be at least 8 characters." ,"danger")
            return redirect(url_for('signup'))
        
        # create new user
        hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')
        new_user = User(username=username, email=email, password=hashed_password ,gender=gender, blood_type=blood_type , birth_date=birth_date ,phone_number=phone_number)
        db.session.add(new_user)
        try:
            db.session.commit()
            flash("Your account has been created successfully!","success")
            return redirect(url_for('login'))
        except Exception as e:
            db.session.rollback()
            flash("An error occurred during account creation. Please try again.", "danger")
            return redirect(url_for('signup'))


    return render_template("signup.html" ,user=current_user)

#===============================logout=========================
@app.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))

#===============================profile=========================
@app.route("/profile" ,methods=["GET" ,"POST"])
@login_required
def profile():
    user = User.query.filter_by(username=current_user.username).first()
    username = user.username if user else None
    email = user.email if user else None
    gender = user.gender if user else None
    blood_type = user.blood_type if user else None
    phone_number = user.phone_number if user else None
    return render_template("profile.html" ,username=username ,email=email,gender=gender , blood_type=blood_type ,birth_date=user.birth_date ,phone_number=phone_number ,user=current_user)


if __name__ == "__main__":
    # do not set debug=True in production
    app.run(host="0.0.0.0", port=4000, debug=True)
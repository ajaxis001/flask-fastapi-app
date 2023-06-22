# Import the Flask module and create a Flask web server from the Flask module
from flask import Flask

# Import the render_template module, which will let us return HTML files as responses
from flask import render_template

# Import the choices function from the random module, which will let us pick a random fruit
from random import choices

# Create a new web application called 'app' (this could be any name), with __name__ representing the current file
app = Flask(__name__)

def random_fruit():
    '''This function selects and returns a random fruit from a list of fruits.'''

    # Create a list of fruits
    fruits = ['apple', 'cherry', 'orange']
    
    # Return a random fruit from the fruits list
    return choices(fruits)

# The route() function of the Flask class is a decorator, which tells the application which URL should call the associated function.
@app.route("/")
def fruit():
    '''This function calls the random_fruit function and then renders an HTML template to display the fruit.'''

    my_fruit = random_fruit()

    # The render_template function renders an HTML file located in a templates folder.
    # Here it's rendering "index.html", and it's passing a title ("Random Fruit") and the random fruit (my_fruit) to the template.
    return render_template("index.html", title="Random Fruit", fruit=my_fruit)

# A conditional statement that checks whether this file (app.py) is the startup file
if __name__ == "__main__":
    # Run the application on the local server at port 8080
    # debug=True allows potential errors to show on the web page, helping us trace the errors.
    app.run(host="127.0.0.1", port=8080, debug=True)


# Please note that this script will not run on its own because it requires an `index.html` file in a directory named `templates` in 
# the same directory as this script. The `index.html` file should be an HTML template that includes placeholders for the title and 
# fruit variables.
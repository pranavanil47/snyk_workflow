# Minimal app with outdated libraries (SCA) and weak patterns for SAST
from flask import Flask, request, render_template_string

app = Flask(__name__)

@app.route('/')
def index():
    name = request.args.get('name', 'world')
    # Using render_template_string on unsanitized input (for SAST signal only)
    return render_template_string('<h1>Hello {{name}}</h1>', name=name)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

from docxtpl import DocxTemplate
from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def hello_world():
    # generate_report()
    return render_template('welcome.jinja2')


def generate_report():
    doc = DocxTemplate("templates/report-template.docx")
    context = {
        'date_start': "World company",
        'date_end': 'End',
        'a_reports': ['任务1', '任务2', '任务3']
    }
    doc.render(context)
    doc.save('templates/各研发小组20180603-20180609周工作报告.docx')

    if __name__ == '__main__':
        app.run()

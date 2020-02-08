# flasky-ui-test

Structure of the repo:

---Pages<br>
|--results<br>
|--screenshots<br>
|--testdata<br>
|--userkeywords<br>
|--variables

Pages:
<br>
Contains POM based robot files containing locators and Keywords to interact with that Page

results:
<br>
Contains test run results

screenshots:
<br>
All screenshots should be saved in this directory

testdata:
<br>
Holds any test data that can be used for further/future test<br>
I have test data in csv format

userkeywords:
<br>
User Defined keywords as python package. Import this in your test/pages robot files as:
<br>
Library  userkeywords/keywords.py

variables:
<br>
defines variables, it can be different for different environments of testing.<br>
[optionally]: While running robot file, we can pass which variables.py to use.

# How to use this repo to run tests
git clone
<br> 
create a virtual environment using python 3.7. Inside the virtualenv install libraries.
<br>
pip install -r requirements.txt
<br>
robot --outputdir results  tests/

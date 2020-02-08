import uuid
from random import randrange

from faker import Faker
import csv


def create_fake_data(prefix='testuser'):
    """
    Create Keyword "Create Fake Data"
    The keyword takes optional parameter to define username prefix generates a random username each time.
    and writes that data to a csv file to use later.
    :param prefix:
    :return:
    """
    fake = Faker(['it_IT', 'en_US', 'ja_JP'])
    username = prefix + str(uuid.uuid1()).split('-')[0]
    password = username
    first_name = fake.first_name()
    last_name = fake.last_name()
    phone_number = fake.phone_number()
    return [username, password, first_name, last_name, phone_number]


def read_csv_file(filename):
    """This creates a keyword named "Read CSV File"

        This keyword takes one argument, which is a path to a .csv file. It
        returns a list of rows, with each row being a list of the data in
        each column.
        """
    data = []
    with open(filename, 'r') as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            data.append(row)
    return data

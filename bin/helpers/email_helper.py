import argparse
import datetime
import os

import yagmail

def email_send_message(subject, notes):
    email = os.environ['EMAIL_ACCOUNT_ADDR']
    gmail_app_password = os.environ['EMAIL_ACCOUNT_KEY']

    yag = yagmail.SMTP(email, gmail_app_password)

    yag.send(to=email, subject=subject, contents=notes)

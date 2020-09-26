import yaml
from os.path import isfile

config_path = '~/.playbooks.yml'
if not isfile(config_path):
    with open(config_path, 'w') as outp:
        outp.write('{}')

config = None
with open(config_path, 'r') as inp:
    config = yaml.load(inp)

questions = {
        'personal_full_name': 'What is your full name?',
        'personal_email': 'What is your email address?',
        'github_username': 'What is your GitHub username?',
        'github_access_token': 'What is your GitHub access token?',
        }

for key, question in questions.items():
    old = config.get(key, '')
    updated = input('{}{}: '.format(question, f'[{old}]' if old else ''))
    config[key] = updated if updated else old

with open(config_path, 'w') as outp:
    outp.write(yaml.dump(config))

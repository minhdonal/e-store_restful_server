import json


class Recomend():
    def __init__(self):
        self.file_name = "./algorithm/result/associationrule.json"

    def read_json(self):
        """
        read file result association rule
        """
        filejson = self.file_name
        if filejson:
            with open(filejson, 'r') as f:
                datastore = json.load(f)
                return datastore

    def search(datastore, item):
        """
        search value in dataset
        """
        resource = datastore.read_json()
        resource = resource.get('rules')
        for obj in resource:
            arr_fist = obj.get('fist')
            if (item in arr_fist):
                return obj.get('next')



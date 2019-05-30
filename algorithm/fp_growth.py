import algorithm.library.pyfpgrowth as fp
import pandas as pd
import json

class AssociationRule:
    def __init__(self, records):
        """
        Association Rule - Fpgrowth
        """
        self.records = self.readCSV()

    @staticmethod
    def fpgrowth(records,minlen,minconf):
        """
        Run algorthm fpgrowthm with input parameter 
        """
        #get len want to show 
        records = records
        patterns = fp.find_frequent_patterns(records, minlen)
        rules = list(fp.generate_association_rules(patterns, minconf))
        data = {}
        arr =[]
        i=0
        while i< (len(rules)-1) :
            values ={}
            values["fist"] = rules[i]
            i+=1
            values["next"]=rules[i]
            i+=1
            arr.append(values)
        data["rules"]=arr
        data["min_sup"]= ''
        data["min_len"]=minlen
        data["min_conf"]=minconf
        return data
        
    @staticmethod
    def readCSV():
        """
        read file csv at folder data with a max (number) name
        """
        DataFileName= "./algorithm/data/store_data.csv"
        store_data = pd.read_csv(
            DataFileName,
            header=None,
            keep_default_na=False)
        count_row = store_data.shape[0]
        count_col = store_data.shape[1]
        #convert Dataframe to Array
        records = []
        for i in range(0,count_row):
            temps = []
            for j in range(0,count_col):
                if (store_data.values[i,j] == ''):
                    break	
                else:
                    temps.append(str(store_data.values[i,j]))
            records.append(temps)
        return records

    def writeJSON(data):
        with open('./algorithm/result/associationrule.json', 'w') as outfile:  
            json.dump(data, outfile)

class RawData:
    def __init__(self,page):
        self.page = page
    def read_data_csv(self):
        DataFileName = "./algorithm/data/store_data.csv"
        page = self.page
        try:
            if page == 0:
                store_data = pd.read_csv(DataFileName, 
                keep_default_na = False,
                header=None,
                nrows=50)
                result = self.convert_to_json(store_data)
                return result
            else:
                store_data = pd.read_csv(DataFileName, 
                keep_default_na = False,
                skiprows=[i for i in range(1,page*50)],
                nrows=50)
                result = self.convert_to_json(store_data)
                return result
                

        except Exception as e:
            response_object = {
                'status': 'fail',
                'message': 'Some error occurred. Please try again.'
            }
            return response_object, 401
    def convert_to_json(self,store_data):
        count_row = store_data.shape[0]
        count_col = store_data.shape[1]
        #convert Dataframe to Array
        result = {}
        result['status'] = 'success'
        records = []
        for i in range(0,count_row):
            temps = []
            for j in range(0,count_col):
                if (store_data.values[i,j] == ''):
                    break	
                else:
                    temps.append(str(store_data.values[i,j]))
            records.append(temps)
        result['data'] = records
        return result
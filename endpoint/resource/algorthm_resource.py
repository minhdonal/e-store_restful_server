from algorithm.fp_growth import AssociationRule, RawData
from flask_restful import Resource, reqparse, request
from endpoint.model.recomend_product import Recomend
class AlgorithmResource(Resource):
    def get(self):
        """
        run algorthm when call api
        """
        minlen = request.args.get('minlen',type = int)
        minconf = request.args.get('minconf',type = float)
        try:
            data = AssociationRule.readCSV()
            result = AssociationRule.fpgrowth(data,minlen,minconf)
            AssociationRule.writeJSON(result)
            response_object = {
                'status': 'success',
                'message': 'Successfully update unselected.'
            }
            return response_object, 201
        except Exception as e:
            response_object = {
                'status': 'fail',
                'message': 'Some error occurred. Please try again.'
            }
            return response_object, 401

class RecommendResource(Resource):
    def get(self):
        try:
            result = Recomend()
            return result.read_json()
        except Exception as e:
            response_object = {
                'status': 'fail',
                'message': 'Some error occurred. Please try again.'
            }
            return response_object, 401

class ReadRawDataRecommend(Resource):
    def get(self):
        page = request.args.get('page',type = int)
        result = RawData(page)
        return result.read_data_csv()

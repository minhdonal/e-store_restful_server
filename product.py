import connectDB as db 

def getProductId(ids=1):
	sqlString="select * from product where id= {}".format(ids)
	result = db.getOneData(sqlString)
	return result

def getListProduct(page=0):
	startPoint = page*10
	endPoint = startPoint+10
	sqlString = "select * from product limit {},{}".format(startPoint,endPoint)
	record = db.getAllData(sqlString)
	for row in record:
		print(row)
	#return result
def insertCustomer():
	sqlString = "INSERT INTO `customer`( `name`, `users`, `pass`) VALUES ('nam','nam','nam')"
	if(db.setData(sqlString)):
		print("True")
insertCustomer()
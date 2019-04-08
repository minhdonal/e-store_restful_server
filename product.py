import connectDB as db 

def getProductId(ids=1):
	sqlString="select * from product where id= {}".format(ids)
	result = db.getOneData(sqlString)
	values = {}
	values["id"]=result[0]
	values["name"]=result[1]
	values["description"]=result[2]
	values["title"]=result[3]
	values["price"]=result[4]
	values["amount"]=result[5]
	return values

def getListProduct(page=0):
	startPoint = page*10
	endPoint = startPoint+10
	sqlString = "select * from product limit {},{}".format(startPoint,endPoint)
	record = db.getAllData(sqlString)
	data = {}
	arr = []
	for row in record:
		values = {}
		values["id"]=row[0]
		values["name"]=row[1]
		values["description"]=row[2]
		values["title"]=row[3]
		values["price"]=row[4]
		values["amount"]=row[5]
		arr.append(values)
	data["product"]=arr
	return data
print(getProductId(1))
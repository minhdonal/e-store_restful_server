import connectDB as db 

def insertCustomer():
	sqlString = "INSERT INTO `customer`( `name`, `users`, `pass`) VALUES ('nam','nam','nam')"
	if(db.setData(sqlString)):
		return True
	return False
def CheckAccount(username,password):
	sqlString="SELECT * FROM `customer` WHERE name='{}' and pass='{}'".format(username,password)
	result = db.getOneData(sqlString)
	if(result):
		values = {}
		values["id"]=result[0]
		values["name"]=result[1]
		values["user"]=result[2]
		values["password"]=result[3]
		return values
	return False
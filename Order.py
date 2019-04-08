import connectDB as db 

def insertOrder(idcustomer):
	sqlStringOrder = "INSERT INTO `orders`(`id_customer`) VALUES ('{}')".format(idcustomer)
	try:
		OrderID =db.setData(sqlStringOrder)
		sqlStringOrderLine = "INSERT INTO `oder_line`(`id`, `id_product`, `quantity`) VALUES ('{}','{}','{}')".format(OrderID,idproduct,quantity)
		db.setData(sqlStringOrderLine)
	except Erros as e:
		print("False as insertOrder")
		return False
	finally:
		return OrderID
def InsertOrderLine(OrderID,idproduct,quantity):
	sqlStringOrderLine = "INSERT INTO `oder_line`(`id`, `id_product`, `quantity`) VALUES ('{}','{}','{}')".format(OrderID,idproduct,quantity)
	try:
		db.setData(sqlStringOrderLine)
	except Erros as e:
		print("False as insertOrder")
		return False
	finally:
		return True
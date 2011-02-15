using tales

class Binding{
	Bind[] bindings := Bind[,
		//Examples: Bind{type= Int#; name = "rows"; to = 10}
		//       or Bind{type=Panel#; name="headerPanel"; to=`/panels/HeaderPanel.fan`}
		//		or  Bind{type=UserService#; to= `/service/UserServiceImpl.fan`}
	]
}
function handleThis() {
	var _this = this;

	return function() {
		console.log(_this);
	};
}

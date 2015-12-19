String.prototype.Trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
};
String.prototype.LTrim = function(){
	return this.replace(/(^\s*)/g, "");
};
String.prototype.Rtrim = function(){
	return this.replace(/(\s*$)/g, "");
};
;(function(array) {
	
	array.last = function() { return this[this.length - 1] }

	array.without = function(index) {
		if (index < 0) { return this }
		return this.slice(0, index).concat(this.slice(index+1, this.length))
	}
	
}(Array.prototype))

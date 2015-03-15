var exec = require("cordova/exec");

var NativeUtils = {
	getGPSState: function(success, failure) {
		exec(
			success || function() {},
			failure || function() {},
			'NativeUtils',
			'getGPState',
			[]
			);
	}
}

module.exports = NativeUtils;
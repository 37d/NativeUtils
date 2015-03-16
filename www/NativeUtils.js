var exec = require("cordova/exec");

var NativeUtils = {
	getGPSState: function(success, failure, config) {

		var dialog = (config && config.dialog) || false;


		exec(
			success || function() {},
			failure || function() {},
			'NativeUtils',
			'getGPSState',
			[dialog]
			);
	}
}

module.exports = NativeUtils;
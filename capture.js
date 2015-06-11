var fs = require('fs');
var page = require('webpage').create();
page.viewPortSize = { width: 302, height: 322 };
page.clipRect = { top: 0, left: 0, width: 302, height: 322 };
var system = require('system');
if (system.args.length != 3) {
  console.log('need 2 arguments: html_file_name png_file_name');
}
page.open('file://' + fs.workingDirectory + '/' + system.args[1], function() {
    page.render(system.args[2]);
    phantom.exit();
});


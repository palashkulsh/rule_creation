// myparser.js
var fs = require("fs");
var jison = require("jison");
var Path = require('path');

var Parser = {
    getSpParser: function () {
        var bnf = fs.readFileSync(Path.join(__dirname ,'./selling_price_grammar.y'), "utf8");
        var parser = new jison.Parser(bnf);
        return parser;
    }
}

module.exports=Parser;

(function () {
    if (require.main == module) {
        var sparser = Parser.getSpParser();
        console.log(sparser.parse('selling price>20 and selling price <40'))
    }
})();

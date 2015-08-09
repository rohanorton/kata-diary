/*jslint node:true*/
'use strict';

// Create a hash table on initialisation
var numeralHash = {};
var numeral = '';
var i;

for (i = 1; i <= 5000; i += 1) {
     numeral += 'I';
     numeral = numeral.replace(/IIII/, 'IV')
                      .replace(/IVI/, 'V')
                      .replace(/VIV/, 'IX')
                      .replace(/IXI/, 'X')
                      .replace(/XXXX/, 'XL')
                      .replace(/XLX/, 'L')
                      .replace(/LXL/, 'XC')
                      .replace(/XCX/, 'C')
                      .replace(/CCCC/, 'CD')
                      .replace(/CDC/, 'D')
                      .replace(/DCD/, 'CM')
                      .replace(/CMC/, 'M');

   numeralHash[i] = numeral;
 }

module.exports = function romanNumeralEncoder(num) {
    return numeralHash[num];
};

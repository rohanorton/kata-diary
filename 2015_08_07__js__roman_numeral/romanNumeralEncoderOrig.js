/*jslint node:true*/
'use strict';

module.exports = function romanNumeralEncoder(num) {
    var returnString = '';

    while (num) {
        num--;
        returnString += 'I';
        returnString = returnString.replace(/IIII/, 'IV')
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
    }

    return returnString;
};

/*jslint node:true*/
'use strict';

// Why is this good?
//
// I find it fairly straightforward to reason about, it's clear
//
// What's not so good?
//
// It's probably fairly slow (loop, variable reassignment?).
// I mean, obviously the fastest solution would be to just have a
// hash ...
//

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

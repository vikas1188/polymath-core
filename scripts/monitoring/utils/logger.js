var winston = require( 'winston' );
var fs = require( 'fs' );
const colors = require('colors');
const moment = require('moment');
var logDirectory = './logs';
var logger;

import { parseLogLevel, getColorMap, colorize, getLogLevels } from './helper.js'

if ( !fs.existsSync( logDirectory ) ) {
 // Create the directory if it does not exist
 fs.mkdirSync( logDirectory );
}

var logger = new (winston.Logger)({
  levels: getLogLevels(),
  transports: [
    new winston.transports.Console({
      colorize: true,
      level: parseLogLevel('info'),
      timestamp: function () {
        return moment().toISOString()
      },
      formatter: function (options) {
        var multiLineFmt = (k, val) =>
          (typeof val === 'string' && val.split('\n').length > 1) ? val.split('\n') : val;

        return '[' + colors.grey(options.timestamp()) + '] ' + colorize(options.level.toUpperCase()) + ' ' + (options.message ? options.message : '') +
          (options.meta && Object.keys(options.meta).length ? '\n\t' + JSON.stringify(options.meta, multiLineFmt, 4) : '')
      }
    }),
    new winston.transports.File({
      filename: logDirectory + '/error.log',
      level: 'error',
      handleExceptions: true,
      formatter: function (options) {
        var multiLineFmt = (k, val) =>
          (typeof val === 'string' && val.split('\n').length > 1) ? val.split('\n') : val;

        return '[' + colors.grey(options.timestamp()) + '] ' + colorize(options.level.toUpperCase()) + ' ' + (options.message ? options.message : '') +
          (options.meta && Object.keys(options.meta).length ? '\n\t' + JSON.stringify(options.meta, multiLineFmt, 4) : '')
      }
    })
  ]
})


module.exports.logger = logger;
const colors = require('colors');
var fs = require( 'fs' );
const shell = require('shelljs');

export const duration = {
    seconds: function (val) { return val; },
    minutes: function (val) { return val * this.seconds(60); },
    hours: function (val) { return val * this.minutes(60); },
    days: function (val) { return val * this.hours(24); },
    weeks: function (val) { return val * this.days(7); },
    years: function (val) { return val * this.days(365); },
  };

  
export const options = {
  day: '2-digit',
  month: '2-digit',
  year: '2-digit',
  hour: '2-digit',
  minute: '2-digit',
  second: '2-digit'
};

export const parseLogLevel = function (level) {
  level = level.toLowerCase()
  if (Object.keys(getLogLevels()).indexOf(level) === -1) return 'info'
  return level
}

export const getColorMap = function () {
  return {
    'info': 'cyan',
    'warn': 'yellow',
    'error': 'red',
    'verbose': 'magenta',
    'debug': 'bgYellow',
    'stats': 'bgBlue'
  }
}

export const colorize = function (string) {
  var type = string.toLowerCase()
  if (typeof getColorMap()[type] !== 'undefined') {
    return colors[getColorMap()[type]](string)
  } else return string
}

export const getLogLevels = function () {
  return {
    error: 0,
    warn: 1,
    info: 2,
    verbose: 3,
    debug: 4,
    stats: 5
  }
}

export async function estimateGas(actionToEstimate, fromAddress, factor, value) {
  let estimatedGAS = Math.round(factor * (await actionToEstimate.estimateGas({from: fromAddress, value: value})));
  return estimatedGAS;
}


export function timeConverter(UNIX_timestamp){
  var a = new Date(UNIX_timestamp * 1000);
  var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  var year = a.getFullYear();
  var month = months[a.getMonth()];
  var date = a.getDate();
  var hour = a.getHours();
  var min = a.getMinutes();
  var sec = a.getSeconds();
  var time = date + ' ' + month + ' ' + year + ' ' + hour + ':' + min + ':' + sec ;
  return time;
}

export function writePid(fileName, pid) {
  if ( !fs.existsSync( "./pid" ) ) {
    // Create the directory if it does not exist
    fs.mkdirSync("./pid");
   }
   try {
    fs.writeFileSync(`./pid/${fileName}`, `${pid}`);
   } catch(error) {
     console.log("error in writing the file",error);
   }
}
  
export function killPid(fileName) {
  if (fs.existsSync( "./pid" )) {
    if (fs.existsSync(`./pid${fileName}`)) {
      let pid = fs.readFileSync(`./pid/${fileName}`, "utf8");
      console.log(pid);
      shell.exec(`kill ${pid}`);
      return true;
    }
    return true;
  }
  return true;
}

export function readPid(fileName) {
  if (fs.existsSync( "./pid" )) {
    if (fs.existsSync(`./pid${fileName}`)) {
      let pid = fs.readFileSync(`./pid/${filename}`, "utf8");
      console.log(pid);
      return pid;
    }
  }
}
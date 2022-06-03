public class DateHelper {
    public static String diffTwoDates(DateTime startD, DateTime endD){
        Long startTime = startD.getTime();
        Long endTime = endD.getTime();

        Long millisec = endTime - startTime;

        return convertSecondToReadable(millisec);
    }

    public static Integer diffTwoDatesInSecond(DateTime startD, DateTime endD){
        Long startTime = startD.getTime();
        Long endTime = endD.getTime();

        Long millisec = endTime - startTime;

        Long ss = millisec / 1000;

        return Integer.valueOf(ss);
    }

    public static String convertSecondToReadable(Long millisec) {
        Long yy = millisec/1000/60/60/24/365;
        Long mm = (millisec/1000/60/60/24/30) - (yy * 12);
        Long dd = (millisec/1000/60/60/24) - (yy * 365) - (mm * 30);
        Long hh = (millisec/1000/60/60) - (yy * 365 * 24) - (mm * 30 * 24) - (dd * 24);
        Long mi = (millisec/1000/60) - (yy * 365 * 24 * 60) - (mm * 30 * 24 * 60) - (dd * 24 * 60) - (hh * 60);
        Long ss = (millisec / 1000) - (yy * 365 * 24 * 3600) - (mm * 30 * 24 * 3600) - (dd * 24 * 3600)- (hh * 3600) - (mi * 60);

        // String result = dd + 'd '+ hh + 'h ' + mi + 'm ' + ss + 's';
        String result = dd + 'd '+ hh + ':' + mi + ':' + ss;

        return result;
    }

    public static Integer convertTimeStringToInteger(String timeInput) {
        Integer totalSecond = 0;
        Integer yy, mm, dd, hh, mi, ss;
        yy = mm = dd = hh = mi = ss = 0;
        // extracting
        String tmp = '';
        // find seconds
        if(timeInput.indexOf('s') != -1) {
            Integer idxSec = timeInput.indexOf('s');
            try{
                tmp = timeInput.substring(idxSec - 2, idxSec);
            }
            catch(Exception e){
                tmp = timeInput.substring(idxSec - 1, idxSec);
            }
            ss = tmp.substring(0, 1) == ' ' ? Integer.valueOf(tmp.substring(1, 2)) : Integer.valueOf(tmp);
        }
        if(timeInput.indexOf('m') != -1) {
            Integer idxMin = timeInput.indexOf('m');
            if(idxMin != 0) {
                try{
                    tmp = timeInput.substring(idxMin - 2, idxMin);
                }
                catch(Exception e){
                    tmp = timeInput.substring(idxMin - 1, idxMin);
                }
                mi = tmp.substring(0, 1) == ' ' ? Integer.valueOf(tmp.substring(1, 2)) : Integer.valueOf(tmp);
            }
        }
        if(timeInput.indexOf('h') != -1) {
            Integer idxHour = timeInput.indexOf('h');
            if(idxHour != 0) {
                try{
                    tmp = timeInput.substring(idxHour - 2, idxHour);
                }
                catch(Exception e){
                    tmp = timeInput.substring(idxHour - 1, idxHour);
                }
                hh = tmp.substring(0, 1) == ' ' ? Integer.valueOf(tmp.substring(1, 2)) : Integer.valueOf(tmp);
            }
        }

        totalSecond = hh * 3600 + mi * 60 + ss;

        return totalSecond;
    }
}
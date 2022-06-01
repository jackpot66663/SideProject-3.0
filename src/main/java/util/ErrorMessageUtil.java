package util;

public class ErrorMessageUtil {
    public enum Error{

        Password_Account_FAIL(1,"登入失敗","帳號或密碼輸入錯誤"),
        No_Exist_Account_FAIL(2,"登入失敗","此帳號尚未註冊"),
        Exist_Account_FAIL(3,"創帳失敗","此帳號已存在，請更改帳號名稱");


        private int errorCode;
        private String errorType;
        private String errorMsg;

        private Error(int errorCode,String errorType,String errorMsg){
            this.errorCode = errorCode;
            this.errorType = errorType;
            this.errorMsg = errorMsg;
        }

        public int getErrorCode() {
            return errorCode;
        }

        public void setErrorCode(int errorCode) {
            this.errorCode = errorCode;
        }

        public String getErrorMsg() {
            return errorMsg;
        }

        public void setErrorMsg(String errorMsg) {
            this.errorMsg = errorMsg;
        }

        public String getErrorType() {
            return errorType;
        }

        public void setErrorType(String errorType) {
            this.errorType = errorType;
        }
    }
}

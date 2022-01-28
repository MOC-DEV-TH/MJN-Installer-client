const app_version = '1.0';

// staging url
const BASE_URL = 'http://mojoenet.myanmaronlinecreations.com/';

// live url
//

//Get page name
const LOGIN = '/login';
const TICKET_STATUS = '/ticket_status';
const CUSTOMER_STATUS = '/customer_status';
const HOME = '/home';
const CUSTOMER_DETAIL = '/customer_detail';
const CUSTOMER_ISSUE = '/customer_issue';
const COMPLETE_CUSTOMER = '/complete_customer';
const COMPLETE_CUSTOMER_LIST = '/complete_complete_list';
const COMPLETE_CUSTOMER_DETAIL_PAGE = '/complete_complete_detail_page';
const MY_APP = '/my_app';


const INSTALLATION = 'installation';
const SERVICE_TICKET = 'service_ticket';
const PENDING = 'pending';
const COMPLETE = 'complete';
const NEW_ORDER = 'new_order';

//app_version
const APP_VERSION = '&app_version=';

//page argument
const PAGE_ARGUMENT = '';

//get storage key
const TOKEN = 'token';
const SAVE_TIME = 'save_time';
const UID = 'uid';
const ALL_DROP_DOWN_LISTS = 'all_drop_down_lists';


// param api
const UID_PARAM = '&uid=';
const STATUS_PARAM = '&status=';
const PROFILE_ID_PARAM = '&profile_id=';
const TICKET_ID_PARAM = '&ticket_id=';


const API_URL = BASE_URL+'api/';
const SUPPORT_LOGIN_URL = API_URL+"support_login";
const LATITUDE_LONGITUDE_URL = API_URL+"hit_support_lat_lon";
const ALL_DDL_DATA = API_URL+"get_all_ddl_data";
const SERVICE_TICKET_LIST_URL = API_URL+"get_service_tickets_lists_by_uid?";
const INSTALLATION_LIST_URL = API_URL+"get_installation_lists_by_uid?";
const GET_INSTALLATION_DETAIL_URL = API_URL+"get_installation_details?";
const GET_SERVICE_TICKET_DETAIL_URL = API_URL+"get_service_tickets_details?";
const POST_INSTALLATION_DATA_URL = API_URL+"post_installation_data";
const POST_SERVICE_TICKET_DATA_URL = API_URL+"post_service_tickets_data";
const GET_ALL_COUNT_URL = API_URL+"get_counts?";

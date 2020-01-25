import {combineReducers} from 'redux';
import rules from './rules';
import errors from './errors';
import messages from "./messages";
import tests from "./tests";
import auth from "./auth"


export default combineReducers({
    rules,
    errors,
    messages,
    tests,
    auth
});
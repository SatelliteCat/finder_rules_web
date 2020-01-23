import {combineReducers} from 'redux';
import rules from './rules';
import errors from './errors';
import messages from "./messages";
import tests from "./tests";


export default combineReducers({
    rules,
    errors,
    messages,
    tests
});
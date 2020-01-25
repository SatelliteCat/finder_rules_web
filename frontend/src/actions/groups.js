import axios from 'axios';
import { createMessage, returnErrors } from "./messages";
import { ADD_RULE, DELETE_RULE, GET_RULES } from "./types";
import { tokenConfig } from './auth';

export const getRules = () => (dispatch, getState) => {
    axios
        .get('/api/group/', tokenConfig(getState))
        .then(res => {
            dispatch({
                type: GET_RULES,
                payload: res.data
            });
        })
        .catch(err => dispatch(returnErrors(err.response.data, err.response.status)));

};

export const deleteRule = (id) => (dispatch, getState) => {
    axios
        .delete(`/api/group/${id}/`, tokenConfig(getState))
        .then(res => {
            dispatch(createMessage({ deleteRule: 'Group Deleted' }));
            dispatch({
                type: DELETE_RULE,
                payload: id
            });
        })
        .catch(err => console.log(err));

};

export const addRule = (rule) => (dispatch, getState) => {
    axios
        .post('/api/group/', rule, tokenConfig(getState))
        .then(res => {
            dispatch(createMessage({ addRule: 'Group Added' }));
            dispatch({
                type: ADD_RULE,
                payload: res.data
            });
        })
        .catch(err => dispatch(returnErrors(err.response.data, err.response.status)));

};
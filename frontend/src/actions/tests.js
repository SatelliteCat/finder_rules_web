import axios from 'axios';
import { createMessage, returnErrors } from "./messages";
import { ADD_RULE, DELETE_RULE, GET_RULES } from "./types";
import { tokenConfig } from './auth';

export const getTests = () => (dispatch, getState) => {
    axios
        .get('/api/test/', tokenConfig(getState))
        .then(res => {
            dispatch({
                type: GET_RULES,
                payload: res.data
            });
        })
        .catch(err => dispatch(returnErrors(err.response.data, err.response.status)));

};

export const deleteTest = (id) => (dispatch, getState) => {
    axios
        .delete(`/api/test/${id}/`, tokenConfig(getState))
        .then(res => {
            dispatch(createMessage({ deleteTest: 'Test Deleted' }));
            dispatch({
                type: DELETE_RULE,
                payload: id
            });
        })
        .catch(err => console.log(err));

};

export const addTest = (test) => (dispatch, getState) => {
    axios
        .post('/api/test/', test, tokenConfig(getState))
        .then(res => {
            dispatch(createMessage({ addTest: 'Test Added' }));
            dispatch({
                type: ADD_RULE,
                payload: res.data
            });
        })
        .catch(err => dispatch(returnErrors(err.response.data, err.response.status)));

};
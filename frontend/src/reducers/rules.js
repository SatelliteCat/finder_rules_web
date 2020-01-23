import {ADD_RULE, CLEAR_RULES, DELETE_RULE, GET_RULES} from "../actions/types";

const initialState = {
    rules: []
};

export default function (state = initialState, action) {
    switch (action.type) {
        case GET_RULES:
            return {
                ...state,
                rules: action.payload
            };
        case DELETE_RULE:
            return {
                ...state,
                rules: state.rules.filter(rule => rule.id !== action.payload)
            };
        case ADD_RULE:
            return {
                ...state,
                rules: [...state.rules, action.payload]
            };
        case CLEAR_RULES:
            return {
                ...state,
                rules: []
            };
        default:
            return state;
    }
}
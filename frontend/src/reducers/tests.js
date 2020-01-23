import { ADD_RULE, CLEAR_RULES, DELETE_RULE, GET_RULES } from "../actions/types";

const initialState = {
    tests: []
};

export default function(state = initialState, action) {
    switch (action.type) {
        case GET_RULES:
            return {
                ...state,
                tests: action.payload
            };
        case DELETE_RULE:
            return {
                ...state,
                tests: state.tests.filter(test => test.id !== action.payload)
            };
        case ADD_RULE:
            return {
                ...state,
                tests: [...state.tests, action.payload]
            };
        case CLEAR_RULES:
            return {
                ...state,
                tests: []
            };
        default:
            return state;
    }
}
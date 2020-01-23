import React, {Component, Fragment} from 'react';
import ReactDOM from 'react-dom';

import {Provider} from 'react-redux';
import store from "../store";

import {Provider as AlertProvider} from 'react-alert';
import AlertTemplate from "react-alert-template-basic";
import Alert from "./layout/Alert";
import {HashRouter as Router, Route, Switch} from 'react-router-dom';

import RulesDashboard from "./rules/Dashboard";
import TestsDashboard from "./tests/Dashboard";
import GroupsDashboard from "./groups/Dashboard";
import Header from "./layout/Header";

const alertOptions = {
    timeout: 3000,
    position: 'top center'
};

class App extends Component {
    render() {
        return (
            <Provider store={store}>
                <AlertProvider template={AlertTemplate} {...alertOptions}>
                    <Router>
                        <Fragment>
                            <Header/>
                            <Alert/>
                            <div className='container'>
                                <Switch>
                                    <Route exact path='/' component={TestsDashboard}/>
                                    <Route exact path='/rule' component={RulesDashboard}/>
                                    <Route exact path='/group' component={GroupsDashboard}/>
                                </Switch>
                            </div>
                        </Fragment>
                    </Router>
                </AlertProvider>
            </Provider>
        )
    }
}

ReactDOM.render(<App/>, document.getElementById('app'));
import React, { Component, Fragment } from 'react';
import { withAlert } from "react-alert";
import { connect } from "react-redux";
import PropTypes from 'prop-types';

export class Alert extends Component {
    static propTypes = {
        error: PropTypes.object.isRequired,
        message: PropTypes.object.isRequired

    };

    componentDidUpdate(prevProps) {
        const { error, alert, message } = this.props;
        if (error !== prevProps.error) {
            if (error.msg.name) alert.error(`Name: ${error.msg.name.join()}`);
            if (error.msg.search_text) alert.error(`Search: ${error.msg.search_text.join()}`);
            if (error.msg.file_types) alert.error(`Types: ${error.msg.file_types.join()}`);
            if (error.msg.group) alert.error(`Group: ${error.msg.group.join()}`);
            if (error.msg.non_field_errors) alert.error(error.msg.non_field_errors.join());
            if (error.msg.username) alert.error(error.msg.username.join());
        }

        if (message !== prevProps.message) {
            if (message.deleteRule) alert.success(message.deleteRule);
            if (message.addRule) alert.success(message.addRule);
            if (message.deleteTest) alert.success(message.deleteTest);
            if (message.addTest) alert.success(message.addTest);
            if (message.passwordsNotMatch) alert.error(message.passwordsNotMatch);
        }
    }

    render() {
        return (
            <Fragment />
        );
    }
}

const mapStateToProps = state => ({
    error: state.errors,
    message: state.messages
});

export default connect(mapStateToProps)(withAlert()(Alert));
import React, {Component} from 'react';
import {connect} from 'react-redux';
import PropTypes from 'prop-types';
import {addTest} from "../../actions/tests";

class Form extends Component {
    state = {
        name: '',
        dir_name: '',
        group: ''
    };

    static propTypes = {
        addTest: PropTypes.func.isRequired
    };

    onChange = e => this.setState({[e.target.name]: e.target.value});
    onSubmit = e => {
        e.preventDefault();
        const {name, dir_name, group} = this.state;
        const test = {name, dir_name, group};
        this.props.addTest(test);
        // this.setState({
        //     name: '',
        //     search_text: '',
        //     file_types: '',
        //     group: ''
        // });
    };

    render() {
        const {name, dir_name, group} = this.state;

        return (
            <div className="card card-body mt-4 mb-4">
                <h2>Add Test</h2>
                <form onSubmit={this.onSubmit}>
                    <div className="form-group">
                        <label>Name</label>
                        <input
                            className="form-control"
                            type="text"
                            name="name"
                            onChange={this.onChange}
                            value={name}
                        />
                    </div>
                    <div className="form-group">
                        <label>URL</label>
                        <input
                            className="form-control"
                            type="text"
                            name="dir_name"
                            onChange={this.onChange}
                            value={dir_name}
                            placeholder='Git or repl.it'
                        />
                    </div>
                    <div className="form-group">
                        <label>Group</label>
                        <input
                            className="form-control"
                            type="text"
                            name="group"
                            onChange={this.onChange}
                            value={group}
                            placeholder='ID'
                        />
                    </div>
                    <div className="form-group">
                        <button type="submit" className="btn btn-primary">
                            Submit
                        </button>
                    </div>
                </form>
            </div>
        );
    }
}

export default connect(null, {addTest})(Form);
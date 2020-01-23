import React, {Component} from 'react';
import {connect} from 'react-redux';
import PropTypes from 'prop-types';
import {addRule} from "../../actions/groups";

class Form extends Component {
    state = {
        name: '',
    };

    static propTypes = {
        addRule: PropTypes.func.isRequired
    };

    onChange = e => this.setState({[e.target.name]: e.target.value});
    onSubmit = e => {
        e.preventDefault();
        const {name} = this.state;
        const rule = {name};
        this.props.addRule(rule);
        // this.setState({
        //     name: '',
        //     search_text: '',
        //     file_types: '',
        //     group: ''
        // });
    };

    render() {
        const {name} = this.state;

        return (
            <div className="card card-body mt-4 mb-4">
                <h2>Add Group</h2>
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
                        <button type="submit" className="btn btn-primary">
                            Submit
                        </button>
                    </div>
                </form>
            </div>
        );
    }
}

export default connect(null, {addRule})(Form);
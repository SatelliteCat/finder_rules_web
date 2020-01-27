import React, { Component } from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { addRule } from "../../actions/rules";
import { getRules as getGroups }  from '../../actions/groups'

class Form extends Component {
    state = {
        name: '',
        search_text: '',
        file_types: '',
        group: '',
        recommendation: ''
    };

    static propTypes = {
        addRule: PropTypes.func.isRequired,
        groups: PropTypes.array.isRequired,
        getGroups: PropTypes.func.isRequired,

    }

    componentDidMount() {
        this.props.getGroups();
    }

    onChange = e => this.setState({ [e.target.name]: e.target.value });
    onSubmit = e => {
        e.preventDefault();
        const { name, search_text, file_types, group, recommendation } = this.state;
        const rule = { name, search_text, file_types, group, recommendation };
        this.props.addRule(rule);
    };

    render() {
        const { name, search_text, file_types, group, recommendation } = this.state;

        return (
            <div className="card card-body mt-4 mb-4">
                <h2>Add Rule</h2>
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
                        <label>Search</label>
                        <textarea
                            className="form-control"
                            type="text"
                            name="search_text"
                            onChange={this.onChange}
                            value={search_text}
                        />
                    </div>
                    <div className="form-group">
                        <label>Types</label>
                        <textarea
                            className="form-control"
                            type="text"
                            name="file_types"
                            onChange={this.onChange}
                            value={file_types}
                        />
                    </div>
                    {/* <div className="form-group">
                        <label>Group</label>
                        <input
                            className="form-control"
                            type="text"
                            name="group"
                            onChange={this.onChange}
                            value={group}
                            placeholder='ID'
                        />
                    </div> */}
                    <div className='form-group'>
                        <label>Group</label>
                        <select>
                            {/* {this.group.map(rule => (
                                <option>{rule.group}</option>
                            ))} */}
                            {this.props.groups.map(group => (
                                <option value={group.id}>{group.name}</option>
                            ))}
                        </select>
                    </div>
                    <div className="form-group">
                        <label>Recommendation</label>
                        <input
                            className="form-control"
                            type="text"
                            name="recommendation"
                            onChange={this.onChange}
                            value={recommendation}
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

const mapStateToProps = state => ({
    groups: state.rules.rules
});

export default connect(mapStateToProps, { addRule, getGroups })(Form);
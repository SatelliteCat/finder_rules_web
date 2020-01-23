import React, {Component, Fragment} from 'react';
import {connect} from 'react-redux';
import PropTypes from 'prop-types';
import {deleteRule, getRules} from '../../actions/rules';

export class Rules extends Component {
    static propTypes = {
        rules: PropTypes.array.isRequired,
        getRules: PropTypes.func.isRequired,
        deleteRule: PropTypes.func.isRequired
    };

    componentDidMount() {
        this.props.getRules();
    }

    render() {
        return (
            <Fragment>
                <h2>Rules List</h2>
                <table className="table table-striped">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Search</th>
                        <th>Types</th>
                        <th>Group</th>
                        <th/>
                    </tr>
                    </thead>
                    <tbody>
                    {this.props.rules.map(
                        rule => (
                            <tr key={rule.id}>
                                <td>{rule.name}</td>
                                <td>{rule.search_text}</td>
                                <td>{rule.file_types}</td>
                                <td>{rule.group}</td>
                                <td>
                                    <button onClick={this.props.deleteRule.bind(this, rule.id)}
                                            className='btn btn-danger btn-sm'>Delete
                                    </button>
                                </td>
                            </tr>
                        )
                    )}
                    </tbody>
                </table>
            </Fragment>
        );
    }
}

const mapStateToProps = state => ({
    rules: state.rules.rules
});

export default connect(mapStateToProps, {getRules, deleteRule})(Rules);
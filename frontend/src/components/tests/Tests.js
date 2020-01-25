import React, { Component, Fragment } from 'react';
import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import { deleteTest, getTests } from '../../actions/tests';

export class Tests extends Component {
    static propTypes = {
        tests: PropTypes.array.isRequired,
        getTests: PropTypes.func.isRequired,
        deleteTest: PropTypes.func.isRequired
    };

    componentDidMount() {
        this.props.getTests();
    }

    state = {
        expandedRows: []
    }

    handleRowClick(rowId) {
        const currentExpandedRows = this.state.expandedRows;
        const isRowCurrentlyExpanded = currentExpandedRows.includes(rowId);

        const newExpandedRows = isRowCurrentlyExpanded ?
            currentExpandedRows.filter(id => id !== rowId) :
            currentExpandedRows.concat(rowId);

        this.setState({ expandedRows: newExpandedRows });
    }

    renderItem(item) {
        const clickCallback = () => this.handleRowClick(item.id);
        const itemRows = [
            <tr onClick={clickCallback} key={"row-data-" + item.id}>
                <td>{item.name}</td>
                <td>{item.dir_name}</td>
                <td>{item.group}</td>
                <td>
                    <button onClick={this.props.deleteTest.bind(this, item.id)}
                        className='btn btn-danger btn-sm'>Delete
                    </button>
                </td>
            </tr>
        ];

        if (this.state.expandedRows.includes(item.id)) {
            itemRows.push(
                <tr key={"row-expanded-" + item.id}>
                    <td colspan="4"><pre>{item.result}</pre></td>
                </tr>
            );
        }

        return itemRows;
    }

    render() {
        let allItemRows = [];

        this.props.tests.map(item => {
            const perItemRows = this.renderItem(item);
            allItemRows = allItemRows.concat(perItemRows);
        });

        return (
            <Fragment>
                <h2>Tests List</h2>

                <table className="table table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Git repository</th>
                            <th>Group</th>
                            <th />
                        </tr>
                    </thead>
                    <tbody>
                        {allItemRows}
                    </tbody>
                </table>

            </Fragment>
        );
    }
}

const mapStateToProps = state => ({
    tests: state.tests.tests
});

export default connect(mapStateToProps, { getTests, deleteTest })(Tests);
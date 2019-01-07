import React  from 'react';
import Routes, { createRootNavigator, SignedOutRoutes, SignedInRoutes } from './routes';
import "./config/StatusBarConfig";


// const App = () => <Routes />;

// export default App;

import { isSignedIn } from "./services/api2";

export default class App extends React.Component {
    state ={
        signed: false,
        signLoaded: false,
    };

    componentDidMount() {
        isSignedIn()
        .then(res => this.setState({signed: res, signLoaded: true}))
        .catch(err => alert("erro"));
    }

    render() {
        const {signLoaded, signed} = this.state;

        if(!signLoaded) {
            return null;
        }

        const Layout = createRootNavigator(signed);
        return <Layout />;
    }
}

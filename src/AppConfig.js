const findFirstExistingProperty = (properties, errorMessage) => {
    const notEmptyProperties = properties.filter(property => property !== undefined);
    if (notEmptyProperties.length === 0) {
        throw new Error(errorMessage);
    }
    return notEmptyProperties[0];
}

const resolveDynamicName = () => {
    return findFirstExistingProperty(
        [window.env.REACT_APP_DYNAMIC_NAME, process.env.REACT_APP_DYNAMIC_NAME],
        'Failed to resolve dynamic name...'
    );
}

export const DYNAMIC_NAME = resolveDynamicName();
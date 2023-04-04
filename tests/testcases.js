const { expect } = require('chai');


describe('Creatorism Pass Contract', function(){
    let NakTokens;
    let NewPass;
    let owner;
    let addr1;
    let addr2;

    beforeEach(async function(){
        [ owner, addr1, addr2 ] = await ethers.getSigners();
        NewPass = await ethers.getContractFactory("NewPass");
        NewPassDeploy = await NewPass.deploy();
    })

    describe('NakTokens contracts', async function(){
        it('checking if NFTs is issued to a address that does not have NAKA NFTs', async function(){
            await NewPassDeploy.connect(0x823dC685e777a7523954388FA7933DA770f49d42).newToken();
            expect(await NewPassDeploy.passIssuedToAddress(0x823dC685e777a7523954388FA7933DA770f49d42)).to.equal(true);
        })
    })

})

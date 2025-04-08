import { create } from 'zustand'

const generalStore = create((set,get) => ({
    logo :"",
    setLogo: (value) => set((state) => ({logo:value})),
}))

export default generalStore
